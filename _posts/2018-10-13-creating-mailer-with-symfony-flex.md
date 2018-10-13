# Creating a Mailer with Symfony Flex

For this sample we are using PHP 7.1.17 and Composer version 1.1.3 


## 1. Install symfony-flex

```bash
composer create-project symfony/skeleton cat-mailer
```

## 2. Install usefull vendors

This will install monolog-bundle, Swift Emailer, Twig template system and 

```bash
composer req logger annotations mailer twig
```
