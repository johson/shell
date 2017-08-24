# coding=utf-8
import time
import json
from scrapy import Request, FormRequest, Selector
from scrapy.spiders import CrawlSpider

__author__ = 'yss'


class CuccresetSpider(CrawlSpider):
    name = 'stocksnap'
    # allowed_domains = ['10086.com']
    start_urls = ['https://stocksnap.io/photo/FY58O0P400']

    def __init__(self, *args, **kwargs):
        super(CuccresetSpider, self).__init__(*args, **kwargs)
        self.userName = 'lidandan5258'
        self.serNo = '11'
        self.newPass = 'zzz251'
        self.currentPage = ''
        self.rtn_list = []  # 详单数据
        self.rtn_list_address = []  # 收货地址数据
        self.count = 0
        self.page = 1
        self.current_bar_count = 0  # 当前处理过的条数
        self.bar_count = 0  # 总条数
        self.totalPage = 0

    def start_requests(self):
        for i, url in enumerate(self.start_urls):
            yield Request(url,
                          meta={'cookiejar': i},
                          dont_filter=True,
                          headers={
                              'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                              'Accept-Encoding': 'gzip, deflate, br',
                              'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
                              # 'Cache-Control':'max-age=0',
                              'Connection': 'keep-alive',
                              'DNT': '1',
                              'Host': 'stocksnap.io',
                              'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:46.0) Gecko/20100101 Firefox/46.0',
                          },
                          callback=self.submit_username)

    def submit_username(self, response):
        self._log_page(response, 'photo/photo.html')
        dl_token = Selector(text=response.body)
        dl_token = dl_token.xpath('//input[@name="dl_token"]/@value').extract_first()
        return FormRequest(
            url='https://stocksnap.io/download-photo/FY58O0P400',
            headers={
                  'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                  'Accept-Encoding': 'gzip, deflate, br',
                  'Accept-Language': 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3',
                  # 'Cache-Control':'max-age=0',
                  'Connection': 'keep-alive',
                  'DNT': '1',
                  'Host': 'stocksnap.io',
                  'Referer':'https://stocksnap.io/photo/FY58O0P400',
                  'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:46.0) Gecko/20100101 Firefox/46.0',
                },
            formdata={
                    'dl_token': dl_token
                },
            meta={'cookiejar': response.meta['cookiejar']},
            callback=self.photo

        )

    def photo(self, response):
        self._log_page(response, 'photo/photo2.html')
        with open('photo/photo.jpg', 'wb')as f:
            f.write(response.body)
            f.close()

    def _log_page(self, response, filename):
        with open(filename, 'w') as f:
            try:
                f.write("%s\n%s\n%s\n" % (response.url, response.headers, response.body))
            except:
                f.write("%s\n%s\n" % (response.url, response.headers))
        pass
