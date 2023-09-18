-- Создание таблицы "Читатели"
CREATE TABLE Readers (
    ReaderID serial PRIMARY KEY, -- Уникальный идентификатор читателя
    Full name text, -- Полное имя читателя
    Address text, -- Адрес читателя
    Phone varchar(15) -- Телефон читателя
);

-- Создание таблицы "Книги"
CREATE TABLE Books (
    BookCode serial PRIMARY KEY, -- Уникальный код книги
    Title text, -- Название книги
    PublicationYear integer, -- Год публикации
    PageCount integer, -- Количество страниц
    Price numeric(10,2), -- Цена книги
    CopiesInStock integer, -- Количество копий в наличии
    PublisherID integer, -- Уникальный идентификатор издателя
    CONSTRAINT fk_publisher
    FOREIGN KEY (PublishersID)
    REFERENCES Publishers(PublishersID) -- Ссылка на таблицу издателей
);

-- Создание таблицы "Авторы"
CREATE TABLE Autors (
    AuthorID serial PRIMARY KEY, -- Уникальный идентификатор автора
    FirstName text, -- Имя автора
    LastName text -- Фамилия автора
);

-- Создание таблицы "Издательства"
CREATE TABLE Publishers (
    PublishersID integer PRIMARY KEY, -- Уникальный идентификатор издательства
    PublishersName text, - Название издательства
    ReaderID integer REFERENCES Readers(ReaderID), -- Ссылка на читателя 
    BookCode integer REFERENCES Books(BookCode), -- Ссылка на книгу
    LoanDate date, -- Дата выдачи
    ReturnDate date -- Дата возврата
);

-- Создание таблицы "Выдача" с внешним ключом
CREATE TABLE Loans (
    LoanID serial PRIMARY KEY, -- Уникальный идентификатор операции ключа
    ReaderID integer REFERENCES Readers(ReaderID), -- Ссылка на читателя
    BookCode integer, -- Атрибут для внешнего ключа
    LoanDate date, -- Дата выдачи
    ReturnDate date, - Дата возврата
    CONSTRAINT fk_book
    FOREIGN KEY (BookCode)
    REFERENCES Books(BookCode) -- Ссылка на книгу
);
