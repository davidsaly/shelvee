class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  #default from: "shelveeapp@gmail.com"
  layout 'mailer'
end
