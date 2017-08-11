# Reset the 'users' table
User.delete_all
cookie_monster = User.create name: 'Cookie Monster', email: 'cookies@example.com', password: 'cookies'
margaret = User.create name: 'Margaret Hamilton', email: 'margaret@example.com', password: 'apollo'
alan = User.create name: 'Alan Turing', email: 'alan@example.com', password: 'enigma'
grace = User.create name: 'Grace Hopper', email: 'grace@example.com', password: 'counterclockwise'



# Reset the 'tasks' table
Task.delete_all
task_data = JSON.parse(open('db/task_examples.json').read)
task_data['tasks'].each do |data|
  t = Task.create name: data['name'],
                 date: data['date'],
                 description: data['description'],
                 user_id: User.sample.id,
                 hour:data['hour'],
                 minute:data['minute'],
                 importance:data['importance']
end
puts "#{User.count} users."
puts "#{Task.count} products."