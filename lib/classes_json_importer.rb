require 'json'

require 'json'

class JsonImporter
  def self.importclasses(file_path)
    file = File.read(file_path)
    data = JSON.parse(file)

    data.each do |class_data|
      class_info = ClassInfo.create!(
        code: class_data["code"],
        class_code: class_data["classCode"],
        semester: class_data["semester"]
      )

      class_data["dicente"].each do |student_data|
        Student.create!(
          name: student_data["nome"],
          course: student_data["curso"],
          registration: student_data["matricula"],
          username: student_data["usuario"],
          formation: student_data["formacao"],
          occupation: student_data["ocupacao"],
          email: student_data["email"],
          class_info: class_info
        )
      end

      teacher_data = class_data["docente"]
      Teacher.create!(
        name: teacher_data["nome"],
        department: teacher_data["departamento"],
        formation: teacher_data["formacao"],
        username: teacher_data["usuario"],
        email: teacher_data["email"],
        occupation: teacher_data["ocupacao"],
        class_info: class_info
      )
    end
  end

  def self.importmembers(file_path)
    file = File.read(file_path)
    data = JSON.parse(file)

    data.each do |item|
      course = Course.create!(
        code: item["code"],
        name: item["name"]
      )

      ClassInfo.create!(
        class_code: item["class"]["classCode"],
        semester: item["class"]["semester"],
        time: item["class"]["time"],
        course: course
      )
    end
  end

end

# JsonImporter.importclasses("classes.json")
# JsonImporter.importmenbers("class_members.json")



#rails generate model Course code:string name:string
#rails generate model ClassInfo class_code:string semester:string time:string course:references

#rails generate model ClassInfo code:string class_code:string semester:string
#rails generate model Student name:string course:string registration:string username:string formation:string occupation:string email:string class_info:references
#rails generate model Teacher name:string department:string formation:string username:string email:string occupation:string class_info:references