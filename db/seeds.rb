Member.create(
  name: "Anh",
  email: "anh@gmail.com",
  password: "12333333",
  admin:true)

Author.create(
  name: "TuanAnh")

Story.create(
  name: "Truyen Cuoi",
  describe: " Truyen 1",
  image: nil,
  author_id: 1,
  member_id: 1)

members = Member.all
members  = Member.first
following = stories[1..5]
followers = stories[2..4]
following.each { |followed| member.follow(followed) }
followers.each { |follower| follower.follow(member) }
