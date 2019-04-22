import requests

def test():
	for line in open("idcardline", "r"):
		line = line.rstrip("\r\n")
		line = line.rstrip(" ")
		items = line.split(",")
		"""
		name = "%s&%s&%s===" %(items[0],items[1],items[2])
		print name
		"""
		r = requests.post("https://xd-api.vipiao.com/activate/addsceneworker", 
			data={"name": items[0], "idcard":items[1], "mobile":items[2]}) 	
		
		print (items[0], r.text)

if __name__ == "__main__":
	test()

