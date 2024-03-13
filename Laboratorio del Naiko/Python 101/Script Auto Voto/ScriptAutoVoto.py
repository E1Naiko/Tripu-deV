from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# List of websites
websites = ["https://best-minecraft-servers.co/server-vulengate.4354", "https://minecraftservers.org/vote/456859", "https://minecraft-server-list.com/server/444110/vote/", "https://topminecraftservers.org/server/30138", "https://servers-minecraft.net/server-vulengate.22358"]

# Initialize web driver
driver = webdriver.Chrome()  # Update with the appropriate driver for your browser

for website in websites:
    # Open the website
    driver.get(website)

    # Find the input box and fill it with "E1Naiko"
    input_box = driver.find_element(By.XPATH, "//input[@id='your_input_id']")
    input_box.send_keys("E1Naiko")

    # Find the "vote" button and click it
    vote_button = driver.find_element(By.XPATH, "//button[@id='vote_button_id']")
    vote_button.click()

    # Add some delay or wait for an element to load if necessary
    # WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//element_xpath")))

# Close the browser window when done
driver.quit()
