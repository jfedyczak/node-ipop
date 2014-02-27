
module.exports =

	# convert IPv4 string to int
	ip4toint: (ip) -> ip.split('.').reduce (a, b) -> (+a << 8) + +b

	# convert string to IPv4
	inttoip4: (v) -> [24,16,8,0].map((i) -> (v >> i) & 255).join '.'

	# check if IPv4 is in subnet
	ip4incidr: (ip, cidr) ->
		[cidr, masklen] = cidr.split '/'
		mask = if masklen is '0' then 0 else -1 << (32 - masklen)
		[ip, cidr] = [ip, cidr].map (ip) -> mask & ipop.ip4toint ip
		return ip is cidr

	# get info about subnet
	cidr4: (cidr) ->
		[cidr, masklen] = cidr.split '/'
		cidr = ipop.ip4toint cidr
		mask = if masklen is '0' then 0 else -1 << (32 - masklen)
		return {
			net: ipop.inttoip4 cidr & mask
			netmask: ipop.inttoip4 mask
			broadcast: ipop.inttoip4 cidr | ~mask
			low: ipop.inttoip4 (cidr & mask) + 1
			high: ipop.inttoip4 (cidr | ~mask) - 1
			hosts: (Math.pow 2, 32 - masklen) - 2
		}

ipop = module.exports

unless module.parent
	console.log ipop.ip4incidr '192.168.1.15', '192.168.0.1/24'
	console.log ipop.ip4incidr '192.168.1.15', '192.168.0.1/16'
	console.log ipop.ip4incidr '192.168.1.15', '192.168.1.15/32'
	console.log ipop.cidr4 '87.239.88.1/22'
