require "pathutil"

# Patch Pathutil to forward keyword arguments correctly on Ruby 3+.
module PathutilKeywordArgsPatch
  def read(*args, **kwd)
    kwd[:encoding] ||= encoding

    if normalize[:read]
      File.read(self, *args, **kwd).encode(universal_newline: true)
    else
      File.read(self, *args, **kwd)
    end
  end

  def binread(*args, **kwd)
    kwd[:encoding] ||= encoding

    if normalize[:read]
      File.binread(self, *args, **kwd).encode(universal_newline: true)
    else
      File.binread(self, *args, **kwd)
    end
  end

  def readlines(*args, **kwd)
    kwd[:encoding] ||= encoding

    lines = File.readlines(self, *args, **kwd)
    return lines unless normalize[:read]

    lines.map { |line| line.encode(universal_newline: true) }
  end

  def write(data, *args, **kwd)
    kwd[:encoding] ||= encoding

    if normalize[:write]
      File.write(self, data.encode(crlf_newline: true), *args, **kwd)
    else
      File.write(self, data, *args, **kwd)
    end
  end

  def binwrite(data, *args, **kwd)
    kwd[:encoding] ||= encoding

    if normalize[:write]
      File.binwrite(self, data.encode(crlf_newline: true), *args, **kwd)
    else
      File.binwrite(self, data, *args, **kwd)
    end
  end
end

Pathutil.prepend(PathutilKeywordArgsPatch)
