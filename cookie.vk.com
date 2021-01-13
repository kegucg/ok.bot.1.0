from selenium import webdriver
import time
import pickle

browser = webdriver.Chrome('C:\\Users\\9\\PycharmProjects\\Bot_Rabo4ii\\chrmedriver\\chromedriver.exe')

browser.get('https://vk.com/')
time.sleep(20)
pickle.dump(browser.get_cookies(),open('session_vkcom','wb'))

