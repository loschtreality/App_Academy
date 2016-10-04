# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([
  {username: 'loren'},
  {username: 'joe'},
  {username: 'frank'}
  ])

  Contact.create!([
    {name: 'sophia', email: 's@a.com', user_id: 1},
    {name: 'victoria', email: 'v@a.com', user_id: 2},
    {name: 'julia', email: 'j@a.com', user_id: 1},
    {name: 'sally', email: 's@y.com', user_id: 3}
    ])

ContactShare.create!([
  {user_id: 2, contact_id: 1},
  {user_id: 1, contact_id: 2},
  {user_id: 3, contact_id: 3},
  {user_id: 2, contact_id: 4}
  ])
