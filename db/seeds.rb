Dir.glob(Rails.root.join('db', 'seeds', '*')).each { |fp| require fp }

raise 'The try to execute database seed on production has been declined' if Rails.env.production?

SeedGenerator.new.generate