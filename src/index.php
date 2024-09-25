<?php
require __DIR__ . '/../vendor/autoload.php';
//require 'vendor/autoload.php';

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

// Create a log channel/
$log = new Logger('name');
$log->pushHandler(new StreamHandler('app.log', Logger::WARNING));

// Add records to the log
$log->warning('Foo');
$log->error('Bar');

echo "Log messages have been created.\n";

