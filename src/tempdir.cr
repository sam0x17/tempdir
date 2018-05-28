require "file_utils"

class TempDir
  getter path : String

  def initialize
    @path = tempdir
  end

  def initialize(prefix)
    @path = tempdir prefix
  end

  def delete
    FileUtils.rm_rf @path
  end

  def to_s
    @path
  end

  def self.create(prefix)
    t = tempdir prefix
    yield t.path
    t.delete
  end

  private def tempdir(prefix="")
    path = "/tmp/#{prefix ? prefix + "-" : ""}#{Random.rand(1000000000000000..9999999999999999)}"
    FileUtils.mkdir_p path
    at_exit do
      FileUtils.rm_rf path
    end
    path
  end
end
