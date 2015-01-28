data BookInfo = Book Int String [String]
				deriving (Show)

type CustomerID = Int
type ReviewBody = String

data BookReview = BetterReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
					| CashOnDelivery
					| Invoice CustomerID
					 deriving (Show)
					 
					 
bookID (Book id title authors) = id
bookTitle (Book id title authors) = title
bookAuthors (Book id title authors) = authors

data Customer = Customer {
				customerID	:: CustomerID
				, customerName	:: String
				, customerAddress	:: Address
				} deriving (Show)