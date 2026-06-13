*** Variables ***

&{STANDARD_USER}
...    username=standard_user
...    password=secret_sauce

&{LOCKED_OUT_USER}
...    username=locked_out_user
...    password=secret_sauce
...    expected_error_text=Epic sadface: Sorry, this user has been locked out.

&{PROBLEM_USER}
...    username=problem_user
...    password=secret_sauce

&{PERFORMANCE_GLITCH_USER}
...    username=performance_glitch_user
...    password=secret_sauce

&{ERROR_USER}
...    username=error_user
...    password=secret_sauce

&{VISUAL_USER}
...    username=visual_user
...    password=secret_sauce

&{INVALID_USER}
...    username=invalid_user
...    password=secret_sauce  
...    expected_error_text=Epic sadface: Username and password do not match any user in this service

&{CHECKOUT_USER}
...    first_name=Roy
...    last_name=Pietersen
...    postal_code=1234AB