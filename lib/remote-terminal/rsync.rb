module RemoteTerminal
  class Rsync
    def run(orig, dest)
      IO.popen("rsync -raze ssh --delete #{orig} #{dest}") do |f|
        return "#{f.readlines.join()}"
      end
    end
  end
end