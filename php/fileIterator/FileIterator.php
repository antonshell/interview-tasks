<?php
use BigFileTools\Driver\ExecDriver;

/**
 * Class FileIterator
 */
class FileIterator implements \SeekableIterator
{
    private $position;

    private $descriptor;

    public $chunkSize;

    public $path;

    /**
     * FileIterator constructor.
     * @param $path
     * @param $chunkSize
     */
    public function __construct($path,$chunkSize)
    {
        if (!file_exists($path)) {
            throw new Exception('File Not exists');
        }

        $this->descriptor = fopen($path, 'r');
        $this->path = $path;
        $this->chunkSize = $chunkSize;
    }

    /**
     * Return the current element
     * @link http://php.net/manual/en/iterator.current.php
     * @return mixed Can return any type.
     * @since 5.0.0
     */
    public function current()
    {
        $this->seek($this->position);
        return fread($this->descriptor, $this->chunkSize);
    }

    /**
     * Move forward to next element
     * @link http://php.net/manual/en/iterator.next.php
     * @return void Any returned value is ignored.
     * @since 5.0.0
     */
    public function next()
    {
        $this->position++;
    }

    /**
     * Return the key of the current element
     * @link http://php.net/manual/en/iterator.key.php
     * @return mixed scalar on success, or null on failure.
     * @since 5.0.0
     */
    public function key()
    {
        return $this->position;
    }

    /**
     * Checks if current position is valid
     * @link http://php.net/manual/en/iterator.valid.php
     * @return boolean The return value will be casted to boolean and then evaluated.
     * Returns true on success or false on failure.
     * @since 5.0.0
     */
    public function valid()
    {
        $def = BigFileTools\BigFileTools::createFrom([
            //CurlDriver::class,
            //NativeSeekDriver::class,
            //ComDriver::class,
            ExecDriver::class,
            //NativeReadDriver::class,
        ]);

        $file = $def->getFile($this->path);
        $bytes = $file->getSize()->minus(1);

        return (bool) $bytes->dividedBy($this->chunkSize, 4)->isGreaterThanOrEqualTo($this->position);
    }

    /**
     * Rewind the Iterator to the first element
     * @link http://php.net/manual/en/iterator.rewind.php
     * @return void Any returned value is ignored.
     * @since 5.0.0
     */
    public function rewind()
    {
        $this->position = 0;
        rewind($this->descriptor);
    }

    /**
     * Seeks to a position
     * @link http://php.net/manual/en/seekableiterator.seek.php
     * @param int $position <p>
     * The position to seek to.
     * </p>
     * @return void
     * @since 5.1.0
     */
    public function seek($position)
    {
        $this->position = $position;

        if ($this->valid() === false) {
            throw new Exception("Invalid position: $position");
        }

        $offset = $this->position * $this->chunkSize;
        fseek($this->descriptor,$offset);
    }
}