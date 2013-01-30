module RemoteTerminal
  class Project
    def initialize(dir)
      tmp = []
      dir.split('/').each do |d|
        if d == '..'
          tmp = tmp[0..-2]
        else
          tmp << d
        end
      end
      @dir = tmp.join('/')
    end
    
    def Project.find(dir)
      if File.exist?(File.join(dir, '.remote-terminal.yml'))
        return Project.new(dir)
      else
        return Project.find(File.join(dir, '..'))
      end
    end
    
    def path_from(dir)
      path = ''
      d = dir.gsub(@dir, '').split('/').keep_if {|d| d != ''}
      if d == []
        path = './'
      else
        d.each do |x|
          path += '../'
        end
      end
      return path[0..-2]
    end
    
    def path_to(dir)
      d = dir.gsub(@dir, '').split('/').keep_if {|d| d != ''}
      if d == []
        return '.'
      else
        return d.join('/')
      end
    end
  end
end