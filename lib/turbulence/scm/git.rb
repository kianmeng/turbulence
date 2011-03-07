<<<<<<< HEAD
require 'open3'
class Turbulence
  module Scm
    class Git 
      class << self
        def log_command(commit_range = "")
          `git log --all -M -C --numstat --format="%n" #{commit_range}`
        end

        def is_repo?(directory)
          FileUtils.cd(directory) {
            Open3.popen3("git status") do |_, _, err, _|
            return !(err.read =~ /Not a git repository/)  
            end
          }
        end
      end
    end
  end
end
=======
class Turbulence
  module Scm
    class Git
      class << self
        def log_command(commit_range)
          `git log --all -M -C --numstat --format="%n" #{commit_range}`
        end

        def is_repo?(directory)
          FileUtils.cd(directory) {
            return !(`git status 2>&1` =~ /Not a git repository/)
          }
        end
      end
    end
  end
end
>>>>>>> 007db25d47381e9fbac9634c35752c4d414a5151
