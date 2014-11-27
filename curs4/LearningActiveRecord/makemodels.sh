#!/bin/bash

cat << EOF > app/models/presidency.rb
class Presidency < ActiveRecord::Base
end
EOF

cat << EOF > app/models/continent.rb
class Continent < ActiveRecord::Base
  has_many :countries
end
EOF

cat << EOF > app/models/country.rb
class Country < ActiveRecord::Base
  has_many   :cities
  belongs_to :continent
end
EOF

cat << EOF > app/models/city.rb
class City < ActiveRecord::Base
  belongs_to :country
end
EOF

cat << EOF > app/models/augmented_city.rb
class AugmentedCity < ActiveRecord::Base
end
EOF

cat << EOF > app/models/continent_statistic.rb
class ContinentStatistic < ActiveRecord::Base
end
EOF

cat << EOF > app/models/user.rb
class User < ActiveRecord::Base
  has_many :contributorships
  has_many :projects, :through => :contributorships
end
EOF

cat << EOF > app/models/project.rb
class Project < ActiveRecord::Base
  has_many :contributorships
  has_many :users, :through => :contributorships
end
EOF

cat << EOF > app/models/contributorship.rb
class Contributorship < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
end
EOF

cat << EOF > app/models/augmented_contributorship.rb
class AugmentedContributorship < ActiveRecord::Base
end
EOF

cat << EOF > app/models/person.rb
class Person < ActiveRecord::Base
end
EOF
