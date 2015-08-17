require_relative 'lib/mastermind_ruby/version'

Gem::Specification.new do |s|
  s.name        = 'mastermind_ruby'
  s.version     = MastermindRuby::VERSION
  s.date        = '2015-08-10'
  s.summary     = "A mastermind library"
  s.description = "Mastermind or Master Mind is a code-breaking game for two players.
                   The modern game with pegs was invented in 1970 by Mordecai Meirowitz, an Israeli postmaster and telecommunications expert.
                   It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century or more.
                   The library is here to reuse the game logic I wrote, and to make your game (UI) as easy as possible to manage."
  s.authors     = ["Yves Siegrist", "Yves Senn"]
  s.email       = 'y.siegrist@4teamwork.ch'
  s.homepage    =
    'https://github.com/Elektron1c97/Mastermind_ruby'
  s.license       = 'MIT'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
end
