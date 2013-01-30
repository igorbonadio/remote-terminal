module RemoteTerminal
  module CLI
    def CLI.config(ip, user, remote_dir, local_dir)
      config = Hash.new
      config['ip'] = ip
      config['user'] = user
      config['remote_directory'] = remote_dir
      File.open(File.join(local_dir, '.remote-terminal.yml'), "w") do |f|
        f.write(config.to_yaml)
      end
    end
      
    def CLI.execute(cmd, rsync, ssh, path)
      puts path
      project = Project.find(path)
      output = rsync.run(project.path_from(path), without_slash("#{project.user}@#{project.ip}:#{project.remote_directory}"))
      output += ssh.run("#{project.user}@#{project.ip}", File.join(project.remote_directory, project.path_to(path)), cmd)
      output += rsync.run(with_slash("#{project.user}@#{project.ip}:#{project.remote_directory}"), project.path_from(path))
      return output
    end
    
    def CLI.without_slash(path)
      if path[-1] == '/'
        return path[0..-2]
      else
        return path
      end
    end
    
    def CLI.with_slash(path)
      if path[-1] == '/'
        return path
      else
        return "#{path}/"
      end
    end
  end
end