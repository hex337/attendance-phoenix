# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Attendance.Repo.insert!(%Attendance.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

use Timex

alias Attendance.Repo
alias Attendance.School
alias Attendance.Role
alias Attendance.Belt
alias Attendance.MeetingType
alias Attendance.Member
alias Attendance.Meeting
alias Attendance.MeetingMember

Repo.delete_all(MeetingMember)
Repo.delete_all(Member)
Repo.delete_all(Meeting)
Repo.delete_all(School)
Repo.delete_all(Role)
Repo.delete_all(Belt)
Repo.delete_all(MeetingType)

Repo.insert! %School{
  comment: "",
  is_active: true,
  name: "San Francisco",
  slug: "san-francisco"
}

Repo.insert! %School{
  comment: "",
  is_active: true,
  name: "Seattle",
  slug: "seattle"
}

roles = ["Student", "Teacher", "Teaching Assistant"]

Enum.each(roles, fn(role) ->
  Repo.insert! %Role{
    comment: "",
    is_active: true,
    name: role
  }
end)

belts = ["White", "High White", "Yellow", "High Yellow", "Green", "High Green", "Blue", "High Blue", "Red", "High Red", "Black"]

Enum.with_index(belts)
|> Enum.each(fn({belt, ndx}) ->
  Repo.insert! %Belt{
    comment: "",
    is_active: true,
    name: belt,
    order_by: ndx + 1
  }
end)

types = ["Advanced", "Basics", "Belt Test", "Concepts/Spar", "Conditioning", "Forms", "General", "Kids", "Kids Advanced", "Quarks"]

Enum.each(types, fn(type) ->
  Repo.insert! %MeetingType{
    comment: "",
    is_active: true,
    name: type
  }
end)

blue_belt = Repo.get_by(Belt, name: "Blue")
black_belt = Repo.get_by(Belt, name: "Black")
white_belt = Repo.get_by(Belt, name: "White")
high_yellow_belt = Repo.get_by(Belt, name: "High Yellow")

sf = Repo.get_by(School, name: "San Francisco")
seattle = Repo.get_by(School, name: "Seattle")

advanced = Repo.get_by(MeetingType, name: "Advanced")
kids = Repo.get_by(MeetingType, name: "Kids")
basics = Repo.get_by(MeetingType, name: "Basics")

teacher = Repo.get_by(Role, name: "Teacher")
student = Repo.get_by(Role, name: "Student")
assistant = Repo.get_by(Role, name: "Teaching Assistant")

alex = Repo.insert! %Member{
  comment: "",
  first_name: "Alex",
  is_active: true,
  is_teacher: false,
  is_kid: false,
  last_name: "Smith",
  belt_id: blue_belt.id,
  school_id: sf.id
}

rachael = Repo.insert! %Member{
  comment: "",
  first_name: "Rach",
  is_active: true,
  is_teacher: true,
  is_kid: false,
  last_name: "Evans",
  belt_id: black_belt.id,
  school_id: sf.id
}

Repo.insert! %Member{
  comment: "",
  first_name: "Tony",
  is_active: true,
  is_teacher: true,
  is_kid: false,
  last_name: "Evans",
  belt_id: black_belt.id,
  school_id: seattle.id
}

peter = Repo.insert! %Member{
  comment: "",
  first_name: "Peter",
  is_active: true,
  is_teacher: false,
  is_kid: true,
  last_name: "Piper",
  belt_id: white_belt.id,
  school_id: sf.id
}

Repo.insert! %Member{
  comment: "",
  first_name: "Inactive",
  is_active: false,
  is_teacher: false,
  is_kid: false,
  last_name: "Member",
  belt_id: white_belt.id,
  school_id: sf.id
}

lou = Repo.insert! %Member{
  comment: "",
  first_name: "Lou",
  is_active: true,
  is_teacher: false,
  is_kid: false,
  last_name: "America",
  belt_id: high_yellow_belt.id,
  school_id: sf.id
}

# Some times for us to use
today = Timex.now()
yesterday = Timex.shift(today, days: -1)

# Create some meetings
basics_meeting = Repo.insert! %Meeting{
  comment: "",
  met: today,
  meeting_type_id: basics.id,
  school_id: sf.id
}

kids_meeting = Repo.insert! %Meeting{
  comment: "",
  met: today,
  meeting_type_id: kids.id,
  school_id: sf.id
}

advanced_meeting = Repo.insert! %Meeting{
  comment: "",
  met: yesterday,
  meeting_type_id: advanced.id,
  school_id: sf.id
}

# Add members to the meetings
Repo.insert! %MeetingMember{
  meeting_id: basics_meeting.id,
  member_id: rachael.id,
  role_id: teacher.id,
  belt_id: black_belt.id
}

Repo.insert! %MeetingMember{
  meeting_id: basics_meeting.id,
  member_id: alex.id,
  role_id: assistant.id,
  belt_id: blue_belt.id
}

Repo.insert! %MeetingMember{
  meeting_id: basics_meeting.id,
  member_id: lou.id,
  role_id: student.id,
  belt_id: high_yellow_belt.id
}

Repo.insert! %MeetingMember{
  meeting_id: kids_meeting.id,
  member_id: rachael.id,
  role_id: teacher.id,
  belt_id: black_belt.id
}

Repo.insert! %MeetingMember{
  meeting_id: kids_meeting.id,
  member_id: peter.id,
  role_id: student.id,
  belt_id: white_belt.id
}

Repo.insert! %MeetingMember{
  meeting_id: kids_meeting.id,
  member_id: alex.id,
  role_id: student.id,
  belt_id: blue_belt.id
}
