<?php
error_reporting(0); //Setting this to E_ALL showed that that cause of not redirecting were few blank lines added in some php files.

$db_config_path = '../application/config/database.php';

// Only load the classes in case the user submitted the form
if ($_POST)
{

    // Load the classes and create the new objects
    require_once('includes/core_class.php');
    require_once('includes/database_class.php');

    $core = new Core();
    $database = new Database();


    // Validate the post data
    if ($core->validate_post($_POST) == true)
    {

        // First create the database, then create tables, then write config file
        if ($database->create_database($_POST) == false)
        {
            $message = $core->show_message('error', "The database could not be created, please verify your settings.");
        }
        else if ($database->create_tables($_POST) == false)
        {
            $message = $core->show_message('error', "The database tables could not be created, please verify your settings.");
        }
        else if ($core->write_config($_POST) == false)
        {
            $message = $core->show_message('error', "The database configuration file could not be written, please chmod application/config/database.php file to 777");
        }

        // If no errors, redirect to registration page
        if (!isset($message))
        {
            $redir = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") ? "https" : "http");
            $redir .= "://" . $_SERVER['HTTP_HOST'];
            $redir .= str_replace(basename($_SERVER['SCRIPT_NAME']), "", $_SERVER['SCRIPT_NAME']);
            $redir = str_replace('install/', '', $redir);
            header('Location: ' . $redir . 'welcome');
        }
    }
    else
    {
        $message = $core->show_message('error', 'Not all fields have been filled in correctly. The host, username, password, and database name are required.');
    }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Install | K-Loans</title>
        <script src="<?= str_replace("index.php", "", $_SERVER['PHP_SELF']) ?>../js/jquery.min.js"></script>
        <script src="<?= str_replace("index.php", "", $_SERVER['PHP_SELF']) ?>../install/js/jquery.form.min.js"></script>

        <style type="text/css">
            body {
                font-size: 75%;
                font-family: Helvetica,Arial,sans-serif;
                width: 300px;
                margin: 0 auto;
            }
            input, label {
                display: block;
                font-size: 18px;
                margin: 0;
                padding: 10px;
                border-radius:10px;
            }
            label {
                margin-top: 20px;
            }
            input.input_text {
                width: 270px;
            }
            input#submit {
                margin: 25px auto 0;
                font-size: 25px;
            }
            fieldset {
                padding: 15px;
                border-radius:10px;
            }
            legend {
                font-size: 18px;
                font-weight: bold;
            }
            .error {
                background: #ffd1d1;
                border: 1px solid #ff5858;
                padding: 4px;
            }
        </style>
    </head>
    <body>

        <center><h1>Install</h1></center>
        <?php
        if (is_writable($db_config_path))
        {
            ?>

            <?php
            if (isset($message))
            {
                echo '<p class="error">' . $message . '</p>';
            }
            ?>

            <form id="install_form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <fieldset>
                    <legend>Database settings</legend>
                    <label for="hostname">Hostname</label><input type="text" id="hostname" value="localhost" class="input_text" name="hostname" />
                    <label for="username">Username</label><input type="text" id="username" class="input_text" name="username" />
                    <label for="password">Password</label><input type="password" id="password" class="input_text" name="password" />
                    <label for="database">Database Name</label><input type="text" id="database" class="input_text" name="database" />
                    <input type="button" value="Install" id="submit" />
                </fieldset>
            </form>

            <?php
        }
        else
        {
            ?>
            <p class="error">Please make the application/config/database.php file writable. <strong>Example</strong>:<br /><br /><code>chmod 777 application/config/database.php</code></p>
        <?php } ?>

    </body>
</html>

<a href="../index.php/welcome" id="lnk-page"></a>

<script>
    $(document).ready(function () {
        $("#submit").click(function () {
            $(this).prop("disabled", true);
            var url = $("#install_form").attr("action");
            $("#install_form").ajaxSubmit({url: url, type: 'post', success: showResponse});

            // Use p.countdown as container, pass redirect, duration, and optional message
            $(this).countdown(redirect, 8, "s remaining");
        });

        function showResponse(data)
        {
        }

        // Our countdown plugin takes a callback, a duration, and an optional message
        $.fn.countdown = function (callback, duration, message) {
            // If no message is provided, we use an empty string
            message = message || "";
            // Get reference to container, and set initial content
            var container = $(this[0]).val("Installing...  " + duration + message);
            // Get reference to the interval doing the countdown
            var countdown = setInterval(function () {
                // If seconds remain
                if (--duration) {
                    // Update our container's message
                    container.val("Installing...  " + duration + message);
                    // Otherwise
                } else {
                    // Clear the countdown interval
                    clearInterval(countdown);
                    // And fire the callback passing our container as `this`
                    callback.call(container);
                }
                // Run interval every 1000ms (1 second)
            }, 1000);

        };



        // Function to be called after 5 seconds
        function redirect() {            
            window.location.href = $("#lnk-page").attr("href");
        }
    });
</script>