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
      
      def CLI.execute(cmd, rsync, ssh, path)
        project = Project.find(path)
        output = rsync.run(project.path_from(path), 'remote_dir')
        output += ssh.run('addr', project.path_to(path), cmd)
        output += rsync.run('remote_dir', project.path_from(path))
        return output
      end
    end
  end
end