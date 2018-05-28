require "file_utils"

class TempDir
  getter path : String

  def initialize
    @path = TempDir.tempdir
  end

  def initialize(prefix)
    @path = TempDir.tempdir prefix
  end

  def delete
    FileUtils.rm_rf @path
  end

  def to_s
    @path
  end

  def self.create(prefix="")
    t = TempDir.new prefix
    yield t.path
    t.delete
  end

  protected def self.tmp_path_string(prefix="")
    "/tmp/#{prefix ? prefix + "-" : ""}#{Random.rand(1000000000000000..9999999999999999)}"
  end

  protected def self.tempdir(prefix="")
    path = tmp_path_string prefix
    while File.exists?(path)
      path = tmp_path_string
    end
    FileUtils.mkdir path
    at_exit do
      FileUtils.rm_rf path
    end
    path
  end
end
