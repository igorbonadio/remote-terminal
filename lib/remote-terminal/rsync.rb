module RemoteTerminal
  class Rsync
    def run(orig, dest)
      IO.popen("rsync -raze ssh #{orig} #{dest}") do |f|
        return "#{f.gets}"
      end
    end
  end
end