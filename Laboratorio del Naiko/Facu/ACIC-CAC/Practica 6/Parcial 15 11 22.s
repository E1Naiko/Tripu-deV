.data
	numero: .double 4
.code
	l.d f6, numero($0)
	add.d f3, f3, f3
	s.d f9, numero($0)
halt