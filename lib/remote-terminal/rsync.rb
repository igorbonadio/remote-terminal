module RemoteTerminal
  class Rsync
    def run(orig, dest)
      puts "rsync -raze ssh #{orig} #{dest}"
      IO.popen("rsync -raze ssh #{orig} #{dest}") do |f|
        return "#{f.readlines.join()}"
      end
    end
  end
end