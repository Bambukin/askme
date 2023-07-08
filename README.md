# ASKME

___

It's an application made for learning purposes. 

It's a social network that allows you to ask and answer questions
from other people and receive answers.  
(similar to askfm)

You can see an example on my website https://askme.sorellia.pro

```
Ruby version - 3.2.1
Rails version - 7.0.5
```

App language: Russian

___

Before running you need to add keys for _recaptcha_ to your credentials:

```
recaptcha:
  site_key: 
  secret_key: 
```

Visit [Recaptcha](https://developers.google.com/recaptcha?hl=en "Recaptcha") for more information.  

Execute the following line in the console to run the program:

```
bundle install

rails db:migrate

rails s
```
