create table if not exists public.faqs (
  id bigserial primary key,
  question text not null,
  answer text not null,
  category text
);

insert into public.faqs (question, answer, category) values
('What is the exam schedule?', 'Semester exams begin on March 10 and end on March 25. The detailed timetable is published in the student portal.', 'exams'),
('How to pay fees?', 'You can pay fees through the student ERP portal under the Fees section using UPI, card, or net banking.', 'fees'),
('Where is the library?', 'The central library is in Block B, second floor, and is open from 8:00 AM to 8:00 PM on weekdays.', 'library'),
('What are college timings?', 'Regular college timings are 9:00 AM to 4:00 PM from Monday to Friday.', 'general'),
('How to apply for leave?', 'Submit your leave request through the LMS Leave Module and inform your class mentor.', 'leave'),
('What is syllabus for semester 1?', 'Semester 1 syllabus is available on the LMS under Academics > Syllabus > Semester 1.', 'syllabus'),
('How to contact faculty?', 'Use the Faculty Directory in the portal for official email addresses and office hours.', 'faculty'),
('What are lab timings?', 'Computer labs are available from 9:00 AM to 6:00 PM, with assisted sessions from 11:00 AM to 4:00 PM.', 'labs'),
('When do results come?', 'Results are typically declared within 4 weeks after the final exam.', 'results'),
('How to access LMS?', 'Go to lms.yourcollege.edu and sign in using your student ID and password.', 'lms'),
('How can I view my timetable?', 'Open the timetable tab in the student portal to view your class schedule by day and semester.', 'timetable'),
('How do I renew library books?', 'You can renew books online from your library account or at the circulation desk before the due date.', 'library');
