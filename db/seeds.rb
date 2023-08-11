# Create Users
userOne = User.create(name: "Fredo", email:"fred@example.com", password: "123456", role: "admin")
userTwo = User.create(name: "Jhonny", email:"jhon@example.com", password: "123456")

# Create Categories
categoryOne = Category.create(name: "Shoes", icon: "icon-1", author_id: userOne)
categoryTwo = Category.create(name: "Tea-shirt", icon: "icon-2", author_id: userTwo)

# Create Transactions
transactionOne = Transaction.create(name: categoryOne.name, amount: 100, author_id: 1)
transactionTwo = Transaction.create(name: categoryTwo.name, amount: -50, author_id: 2)

# Create CategoryTransactions associations
categoryTne = CategoryTransaction.create(category_id: categoryOne, transaction_id: transactionOne)
categoryWo = CategoryTransaction.create(category_id: categoryTwo, transaction_id: transactionTwo)