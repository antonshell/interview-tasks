# Cache Decorator

Задание: Проведите Code Review. Необходимо написать, с чем вы не согласны и почему.

Дополнительное задание: Напишите свой вариант. 
Решение должно быть представлено в виде ссылки на codeshare.io.

Требования были: Добавить возможность получения данных от стороннего сервиса. Необходимо учесть высокую нагрузку при запросе к этой информации и медленную работу сервиса. Точность данных на текущий момент не критична.

DataProvider

```
<?php

namespace src\Integration;

class DataProvider
{
    private $host;
    private $user;
    private $password;

    /**
     * @param $host
     * @param $user
     * @param $password
     */
    public function __construct($host, $user, $password)
    {
        $this->host = $host;
        $this->user = $user;
        $this->password = $password;
    }
    
    /**
     * @param array $request
     *
     * @return array
     */
    public function get(array $request)
    {
        // returns a response from external service
    }
}
```

Decorator

```
<?php

namespace src\Decorator;

use DateTime;
use Exception;
use Psr\Cache\CacheItemPoolInterface;
use Psr\Log\LoggerInterface;
use src\Integration\DataProvider;

class DecoratorManager extends DataProvider
{
    public $cache;
    public $logger;

    /**
     * @param string $host
     * @param string $user
     * @param string $password
     * @param CacheItemPoolInterface $cache
     */
    public function __construct($host, $user, $password, CacheItemPoolInterface $cache)
    {
        parent::__construct($host, $user, $password);
        $this->cache = $cache;
    }

    public function setLogger(LoggerInterface $logger)
    {
        $this->logger = $logger;
    }

    /**
     * {@inheritdoc}
     */
    public function getResponse(array $input)
    {
        try {
            $cacheKey = $this->getCacheKey($input);
            $cacheItem = $this->cache->getItem($cacheKey);
            if ($cacheItem->isHit()) {
                return $cacheItem->get();
            }

            $result = parent::get($input);

            $cacheItem
                ->set($result)
                ->expiresAt(
                    (new DateTime())->modify('+1 day')
                );

            return $result;
        } catch (Exception $e) {
            $this->logger->critical('Error');
        }

        return [];
    }

    public function getCacheKey(array $input)
    {
        return json_encode($input);
    }
}
```

#Solve

1 .	В коде подразумевается использование шаблона проектирования Декоратор. По крайней мере, фигурирует в названии класса. При этом, по сути, мы имеем дело с обычным наследованием. Предлагаю либо назвать класс наследник по-другому, чтобы не создавать путаницу. Либо реализовать шаблон Декоратор. 
http://designpatternsphp.readthedocs.io/ru/latest/Structural/Decorator/README.html

2 .	Возможно, стоит использовать другой механизм генерации ключей. Сейчас получается, что ключ – это json_encode данных. При этом, если данных много, то ключ получается достаточно длинным.Также, если данные немного различаются, это не будет видно по ключу. Возможно, лучше использовать md5(serialize($array)) либо md5(json_encode($array)); 

3 .	В классе DecoratorManager явно используется логгер. При этом логгер является опциональной зависимостью. Нужно либо задать значение по умолчанию. Либо сделать обязательной зависимостью. Возможно, стоит вынесли логгирование в отдельный декоратор.

4 .	Рекомендую также реализовать метод invalidate для ручной инвалидацию кэша.

5 . Логгирование недостаточно информативное. Срабатывает только на критическую ошибку.
Имеет смысл сделать логгирование при чтении из api, чтении из кэша, и при ошибке.
В логах указывать больше информации.

6 .	Возможно, мелкие недочеты. Например здесь используется цепочка обязанностей.

```
$cacheItem->set($result)->expiresAt((new DateTime())->modify('+1 day'));
```

У меня так не заработало, пришлось сделать по-другому:

```
$expiresAt = (new \DateTime())->modify('+1 day');
$cacheItem->set($result);
$cacheItem->expiresAt($expiresAt);
```

7 . В качестве дополнительного задания написал свой вариант. Использовал шаблон Декоратор. В итоге получилось несколько файлов.
Также сделал простейшую реализацию кэша, с ручной инвалидацией. Сдеал простейшую реализацию логгера. Использовал Интерфейсы из PSR. 
Залил на codeshare, но там нет поддержки нескольких файлов(не нашел). В итоге сложил все вместе, но отметил границы файлов. 
https://codeshare.io/axPnJL

Полная версия примера тут:
https://github.com/antonshell/cache-decorator-example

PS: понимаю, что можно было бы вообще обойтись без использования паттерна декоратор и сделать просто наследованием.
