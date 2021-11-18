import 'package:flutter/material.dart';
import 'package:levys_books_rating/book_card_class.dart';
import 'consts.dart';

class BookCard extends StatefulWidget {
  BookCard({ Key? key, required this.largeScreen, required this.book}) : super(key: key);

  bool largeScreen;
  BookCardClass book;

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return bookCardBuild(context);
  }

  Widget bookCardBuild(BuildContext context) {
    return Container(
        padding: cardDefaultPadding,
        height: widget.largeScreen ? heightOfCardLargeScreen : heightOfCardSmallScreen,
        width: widget.largeScreen ? widthOfCardLargeScreen(MediaQuery. of(context). size. width) : widthOfCardSmallScreen(MediaQuery. of(context). size. width),
        child: buildCard(context)
    );
  }

  Widget buildCard(BuildContext context) {
    return
      widget.book.language == "Hebrew"
          ? Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: cardDefaultPadding),
            bookDataInCard(CrossAxisAlignment.end, TextAlign.right, context),
            const Padding(padding: cardDefaultPadding),
            bookImageInCard(context),
          ],
        ),
        elevation: 10, // TODO: make consts
      ) : Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: cardDefaultPadding),
            bookImageInCard(context),
            const Padding(padding: cardDefaultPadding),
            bookDataInCard(CrossAxisAlignment.start, TextAlign.left, context)
          ],
        ),
        elevation: 10,
      );
  }

  Widget bookImageInCard(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    return Container(
      height: widget.largeScreen ? cardRowHeightLargeScreen : cardRowHeightSmallScreen,
      width: widget.largeScreen ? cardImageWidthLargeScreen(width) : cardImageWidthSmallScreen(width),
      // padding: cardDefaultPadding,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(widget.book.image), fit: BoxFit.fitWidth),
        borderRadius: BorderRadius.circular(cardBorderRadius),
        color: Colors.red
      ),
    );
  }

  Widget bookDataInCard(CrossAxisAlignment alignment, TextAlign textAlignment, BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    return SizedBox(
      width: widget.largeScreen ? cardDataWidthLargeScreen(width) : cardDataWidthSmallScreen(width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: alignment,
        children: [
          const Padding(padding: cardDefaultPadding),
          SizedBox(
            height: widget.largeScreen ? cardTitleHeightLargeScreen(width) : cardTitleHeightSmallScreen(width),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                widget.book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: widget.largeScreen ? cardSubTitleHeightLargeScreen(width) : cardSubTitleHeightSmallScreen(width),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                widget.book.author + " - " + widget.book.year,
              ),
            ),
          ),
          const Padding(padding: cardDefaultPadding),
          SizedBox(
            height: widget.largeScreen ? cardDataHeightLargeScreen : cardDataHeightSmallScreen,
            child: ListView(
              children: [
                Text(
                    widget.book.bookData,
                    style: const TextStyle(fontSize: bookDataFontSize,),
                    textAlign: textAlignment
                ),
              ],
            ),
          ),
          const Padding(padding: cardDefaultPadding),
          Stack(
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(0, cardRatingScalePadding, 0, 0)),
                  SizedBox(
                    height: ratingScaleHeight,
                    child: Row(
                      children: [
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(cardBorderRadius),
                              topLeft: Radius.circular(cardBorderRadius),
                            ),
                          ),
                        )),
                        Expanded(child: Container(color: Colors.redAccent,)),
                        Expanded(child: Container(color: Colors.yellowAccent,)),
                        Expanded(child: Container(color: Colors.greenAccent,)),
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(cardBorderRadius),
                              topRight: Radius.circular(cardBorderRadius),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, cardRatingScalePadding)),
                ],
              ),


              Column(
                children: [
                  widget.largeScreen
                   ? Padding(padding: EdgeInsets.fromLTRB(0, ratingCirclePaddingFromTop(width, ratingCircleSize, cardDataWidthLargeScreen), 0, 0))
                   : Padding(padding: EdgeInsets.fromLTRB(0, ratingCirclePaddingFromTop(width, ratingCircleSize, cardDataWidthSmallScreen), 0, 0)),

                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: ratingCirclePaddingFromLeft(widget.largeScreen ? cardDataWidthLargeScreen(width) : cardDataWidthSmallScreen(width), widget.book.rating))),
                      Container(
                        width: widget.largeScreen ? ratingCircleSize(width, cardDataWidthLargeScreen) : ratingCircleSize(width, cardDataWidthSmallScreen),
                        height: widget.largeScreen ? ratingCircleSize(width, cardDataWidthLargeScreen) : ratingCircleSize(width, cardDataWidthSmallScreen),
                        decoration: BoxDecoration(
                          // color: Colors.lightBlue,
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("rating/" + (widget.book.rating).toString() + ".png"), fit: BoxFit.fill)
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
