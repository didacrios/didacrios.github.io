# Create Entities from an existing database in a Symfony4 project #

You could go to the official documentation in https://symfony.com/doc/current/doctrine/reverse_engineering.html


https://symfony.com/doc/current/doctrine/reverse_engineering.html

First import the structure
```php bin/console doctrine:mapping:import App\\Entity annotation --path=src/Entity```

Then generate getters and setters for your created entities

```php bin/console make:entity --regenerate App```
