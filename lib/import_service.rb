require 'json'

class ImportService
  def self.import(json_data)
    json_data.each do |class_data|
      class_info = ClassInfo.find_or_create_by!(
        code: class_data["code"],
        class_code: class_data["classCode"],
        semester: class_data["semester"]
      )

      class_data["dicente"].each do |student_data|
        student = Student.find_or_initialize_by(registration: student_data["matricula"])
        student.update!(
          name: student_data["nome"],
          course: student_data["curso"],
          username: student_data["usuario"],
          formation: student_data["formacao"],
          occupation: student_data["ocupacao"],
          email: student_data["email"],
          class_info: class_info
        )
      end

      teacher_data = class_data["docente"]
      teacher = Teacher.find_or_initialize_by(username: teacher_data["usuario"])
      teacher.update!(
        name: teacher_data["nome"],
        department: teacher_data["departamento"],
        formation: teacher_data["formacao"],
        email: teacher_data["email"],
        occupation: teacher_data["ocupacao"],
        class_info: class_info
      )
    end
  end
end
