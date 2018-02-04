# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

DATA = {
  :user_keys =>
    ["first_name", "last_name", "email", "password", "password_confirmation"],
  :users => [
    ["Lisa", "H","lisa@example.com", "bubbleTea","bubbleTea"],
    ["Mike", "N","mike@example.com", "letsRace", "letsRace"],
    ["Stef", "P","stef@example.com", "MarvinDaBest", "MarvinDaBest"]
  ],
  :work_experiences_keys =>
   ["user_id", "start_date", "end_date", "title", "employer", "location", "experience", "ranking"],
  :work_experiences => [
    [1, "Nov, 2012", "Present", "Founder", "Food and Chatter", "Cape Town", "Digital marketing", 1],
    [1, "Jun, 2015", "Feb, 2016", "Senior Consultant", "PwC", "Taipei", "SAP migrations", 2],
    [2, "Jan 2017", "Present", "Staff Engineer", "LinkedIn", "Mountain View", "Provide mentorship and leadership training for some of the company's most senior engineers", 1],
    [2, "Sep, 2015", "Present", "Owner", "Mike Works", "Mountain View", "I provide some of the best engineering teams in the world with world-class developer training", 2],
    [3, "May 2016", "Present", "Staff Engineer", "Google", "Mountain View", "Google Maps", 1],
    [3, "Jan, 2015", "Apr 2016", "Front end engineer", "Facebook", "Menlo Park", "Optimize performance", 2]
  ],
  :job_listings_keys =>
    ["company","title", "summary", "description", "qualifications", "url"],
  :job_listings => [
    ["Amazon",
     "AMS Curriculum Developer", 
     "Amazon Web Services has an opening for a Curriculum Developer who thrives in a dynamic, fast-paced environment and has a strong training and development background",
     "As a curriculum developer, you will be responsible for analyzing, designing and developing high quality training content for technical and non-technical learning programs for AWS Managed Services (AMS) global sites.",
     "Demonstrated experience in curriculum development tools, learning management systems, and MS Office.",
     "https://www.linkedin.com/jobs/view/505808298/"],
     ["GE Digital",
     "Staff Software Engineer", 
     "As Staff Software Engineer of Predix Cloud, you will build the foundation for GE's Predix Cloud.",
     "Working closely with GE Digital technical product managers, you will deliver the platform that runs GE's Industrial Internet.",
     "Experience in building scalable and highly available distributed systems",
     "https://www.linkedin.com/jobs/view/576369993/"],
     ["Atlassian",
     "Front End Developer, Confluence", 
     "You'll be directly impacting the customer experience through the design and implementation of new features and functionalities in Confluence.",
     "You'll collaborate with other developers to write the best code for the project and deliver amazing results that our users love.",
     "Specialization in Javascript, HTML5, CSS",
     "https://www.linkedin.com/jobs/view/533194273/"]
  ],
  :applications_keys =>
    ["cover_letter","status", "submit_date", "user_id", "job_listing_id"],
  :applications => [
    ["Hello there!", "Submitted", Time.now, 1, 3]
  ]
}

def make_users
    DATA[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
end

def make_work_experiences
    DATA[:work_experiences].each do |work|
      new_work = WorkExperience.new
      work.each_with_index do |attribute, i|
        new_work.send(DATA[:work_experiences_keys][i]+"=", attribute)
      end
      new_work.save
    end
end

def make_jobs
    DATA[:job_listings].each do |job|
      new_job = JobListing.new
      job.each_with_index do |attribute, i|
        new_job.send(DATA[:job_listings_keys][i]+"=", attribute)
      end
      new_job.save
    end
end

def make_applications
  DATA[:applications].each do |app|
    new_application = Application.new
    app.each_with_index do |attribute, i|
      new_application.send(DATA[:applications_keys][i]+"=", attribute)
    end
    new_application.save
  end
end

def main
    make_users
    make_work_experiences
    make_jobs
    make_applications
end

main