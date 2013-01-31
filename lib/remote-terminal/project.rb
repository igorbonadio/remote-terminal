module RemoteTerminal
  class Project
    attr_reader :address
    attr_reader :user
    attr_reader :remote_directory
    
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
      load_config
    end
    
    def load_config
      config = YAML::load(File.open(File.join(@dir, '.remote-terminal.yml')))
      @address = config['address']
      @user = config['user']
      @remote_directory = config['remote_directory']
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
        return ''
      else
        d = d.join('/')
        if d[-1] == '/'
          return d
        else
          return "#{d}/"
        end
      end
    end
  end
end