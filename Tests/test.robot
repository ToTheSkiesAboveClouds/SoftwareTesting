import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from browserstack_config import BROWSERS, HUB_URL

def init_remote_driver(browser_name):
    caps = BROWSERS[browser_name]
    if browser_name == "chrome":
        options = webdriver.ChromeOptions()
    elif browser_name == "firefox":
        options = webdriver.FirefoxOptions()
    elif browser_name == "safari":
        options = webdriver.SafariOptions()

    for k, v in caps.items():
        options.set_capability(k, v)

    driver = webdriver.Remote(
        command_executor=HUB_URL,
        options=options
    )
    return driver

@pytest.mark.parametrize("browser", ["chrome", "firefox", "safari"])
def test_demo_blaze_homepage(browser):
    driver = init_remote_driver(browser)
    driver.get("https://www.demoblaze.com/")
    
    # Проверяем, что есть кнопка Sign up
    signup_button = driver.find_element(By.ID, "signin2")
    assert signup_button.is_displayed()
    
    driver.quit()
