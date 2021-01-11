from selenium import webdriver
from selenium.webdriver.common.keys import Keys

from data import username, password
import time
import random


class okBot():
    def __init__(self, username, password):

        self.ussername = username
        self.password = password
        self.browser = webdriver.Chrome('C:\\Users\\Алмаз\\PycharmProjects\\bot_rabota\\venv\\chromedriver\\chromedriver.exe')

    def login_in(self):
        browser = self.browser
        browser.get('https://bosslike.ru/login/')
        time.sleep(random.randrange(3, 5))

        username_input = browser.find_element_by_id('User_loginLogin')
        username_input.send_keys(username)

        time.sleep(2)

        password_input = browser.find_element_by_id('User_passwordLogin')
        password_input.send_keys(password)

        password_input.send_keys(Keys.ENTER)
        time.sleep(5)

        browser.get('https://ok.ru/')
        time.sleep(3)

        log_in = browser.find_element_by_xpath('//*[@id="field_email"]')
        pas_in = browser.find_element_by_xpath('//*[@id="field_password"]')
        log_in.send_keys('79083389157')

        time.sleep(2)

        pas_in.send_keys('5qr1-bfBH-a4lG')
        time.sleep(1)

        pass_in = browser.find_element_by_xpath('//*[@id="anonymPageContent"]/div[2]/div/div[3]/form/div[5]/div[1]/input')
        pass_in.click()
        time.sleep(2)

    def like_in(self):

        like_in = self.browser.find_element_by_css_selector('.btn-sm')
        like_in.click()

        window_after = self.browser.window_handles[1]
        self.browser.switch_to.window(window_after)
        time.sleep(random.randrange(10, 15))

        self.browser.find_element_by_xpath('//*[@id="hook_Block_AltGroupMainMenu"]/ul/div').click()
        time.sleep(2)
        self.browser.close()

    def auto_like_in(self):

        time.sleep(2)
        self.browser.get('https://bosslike.ru/tasks/odnoklassniki/subscribe/')
        window_before = self.browser.window_handles[0]

        for i in range(25):
            time.sleep(1)
            try:
                self.like_in()
                time.sleep(2)
                self.browser.switch_to.window(window_before)

            except Exception:
                time.sleep(2)
                self.browser.switch_to.window(window_before)
                self.browser.refresh()

    def task_mo(self):
        time.sleep(1)

        more = self.browser.find_element_by_id('task_more')
        more.click()
        time.sleep(random.randrange(1, 3))

        action = ActionChains(self.browser)
        for _ in range(100):
            action.send_keys(Keys.ARROW_UP)
            time.sleep(1)
        action.perform()

        time.sleep(random.randrange(300, 600))

bot = okBot(username, password)
bot.login_in()
bot.auto_like_in()
