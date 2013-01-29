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
  end
end