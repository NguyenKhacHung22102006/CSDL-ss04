CREATE DATABASE IF NOT EXISTS abcxyz;
USE abcxyz;

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE teacher (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    total_sessions INT CHECK (total_sessions>0),
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

CREATE TABLE enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enroll_date DATE NOT NULL,
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE score (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    mid_score DECIMAL(3,1) CHECK (mid_score >= 0 AND mid_score <= 10),
    final_score DECIMAL(3,1) CHECK (final_score >= 0 AND final_score <= 10),
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO teacher (full_name, email) VALUES 
('Nguyen Van A', 'nguyenvana@abc.edu.vn'),
('Tran Thi B', 'tranthib@abc.edu.vn'),
('Le Van C', 'levanc@abc.edu.vn');

INSERT INTO student (full_name, date_of_birth, email) VALUES 
('Pham Van Nam', '2003-05-10', 'nam.pham@st.abc.edu.vn'),
('Le Thi Huong', '2003-08-20', 'huong.le@st.abc.edu.vn'),
('Doan Minh Tuan', '2002-12-01', 'tuan.doan@st.abc.edu.vn'),
('Hoang Thi Mai', '2003-02-15', 'mai.hoang@st.abc.edu.vn');

INSERT INTO course (course_name, description, total_sessions, teacher_id) VALUES 
('Co so du lieu', 'Nhap mon SQL va thiet ke CSDL', 15, 1),
('Lap trinh Web', 'HTML, CSS, JS can ban', 20, 2),
('Cau truc du lieu', 'Thuat toan va giai thuat C++', 18, 1);

INSERT INTO enrollment (student_id, course_id, enroll_date) VALUES 
(1, 1, '2023-09-05'),
(1, 2, '2023-09-06'),
(2, 1, '2023-09-05'),
(3, 3, '2023-09-10'),
(4, 2, '2023-09-12');

INSERT INTO score (student_id, course_id, mid_score, final_score) VALUES 
(1, 1, 8.5, 9.0),
(1, 2, 7.0, 7.5),
(2, 1, 6.5, 8.0),
(3, 3, 9.0, 9.5),
(4, 2, 5.5, 6.0);