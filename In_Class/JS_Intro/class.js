function Student(first, last, courses = []) {
  this.firstName = first,
  this.lastName = last,
  this.courses = courses
}

function Course(name, department, credits, students = [], time = {}){
  this.name = name,
  this.department = department,
  this.credits = credits,
  this.students = students,
  this.time = time
}

Student.prototype.name = function () {
  return `${this.firstName} ${this.lastName}`
}

Student.prototype.enroll = function (course) {
  if (!this.hasConflict(course)){
    this.courses.push(course)
    course.addStudent(this)
  }else{
    console.log("you have a conflict")
  }
}

Student.prototype.courseLoad = function () {
  let hash = {};

  this.courses.forEach(function(e){
    if (hash[e.department]){
      hash[e.department] += e.credits;
    }else{
      hash[e.department] = e.credits;
    }
  });
  return hash;
}

Course.prototype.addStudent = function (student) {
  this.students.push(student.name())
}

Course.prototype.addTime = function (day, timeBlock) {
  this.time[day] = timeBlock
}

Course.prototype.conflict = function (course) {
  for (var day in this.time) {
    if (this.time[day] === course.time[day]) {
      return true
    }
  }
  return false
}

Student.prototype.hasConflict = function (course) {
  return this.courses.some(function(e){
    return e.conflict(course);
  });
}

let l = new Student("Loren", "Loschiavo")
let d = new Student("Deep", "Taylor")

let e = new Course("English", "English", 3)
let j = new Course("JavaScript", "Tech", 9001)

e.addTime("monday", "block1");
j.addTime("monday", "block1");

d.enroll(e)
d.enroll(j)

l.enroll(j)
l.enroll(e)

console.log(e.students);
console.log(d.courses);
// console.log(l.courses);

// console.log(e.conflict(j));
