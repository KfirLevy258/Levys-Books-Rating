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
        padding: defaultPadding,
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
            const Padding(padding: defaultPadding),
            bookDataInCard(CrossAxisAlignment.end, TextDirection.rtl, context),
            const Padding(padding: defaultPadding),
            bookImageInCard(context),
          ],
        ),
        elevation: defaultElevation,
      ) : Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            bookImageInCard(context),
            const Padding(padding: defaultPadding),
            bookDataInCard(CrossAxisAlignment.start, TextDirection.ltr, context),
            const Padding(padding: defaultPadding),
          ],
        ),
        elevation: defaultElevation,
      );
  }

  Widget bookImageInCard(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    return Container(
      height: widget.largeScreen ? cardRowHeightLargeScreen : cardRowHeightSmallScreen,
      width: widget.largeScreen ? cardImageWidthLargeScreen(width) : cardImageWidthSmallScreen(width),
      // padding: cardDefaultPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: NetworkImage(widget.book.image)
        ),
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    );
  }

  Widget bookDataInCard(CrossAxisAlignment alignment, TextDirection direction, BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    return SizedBox(
      width: widget.largeScreen ? cardDataWidthLargeScreen(width) : cardDataWidthSmallScreen(width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: alignment,
        children: [
          const Padding(padding: defaultPadding),
          SizedBox(
            height: widget.largeScreen ? cardTitleHeightLargeScreen(width) : cardTitleHeightSmallScreen(width),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SelectableText(
                widget.book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: widget.largeScreen ? cardSubTitleHeightLargeScreen(width) : cardSubTitleHeightSmallScreen(width),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SelectableText(
                widget.book.author + " - " + widget.book.year,
              ),
            ),
          ),
          const Padding(padding: defaultPadding),
          Directionality(
            textDirection: direction,
            child: SizedBox(
              height: widget.largeScreen ? cardDataHeightLargeScreen : cardDataHeightSmallScreen,
              child: ListView(
                children: [
                  SelectableText(
                      widget.book.bookData,
                      style: const TextStyle(fontSize: bookDataFontSize,),
                      textAlign: TextAlign.justify
                  ),
                ],
              ),
            ),
          ),
          const Padding(padding: defaultPadding),
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
                        Expanded(child: Container(color: Colors.orange,)),
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
                          shape: BoxShape.circle,
                          // TODO: once there is database, inser image from web
                          image: DecorationImage(image: AssetImage(tempGetImageAsset((widget.book.rating).toString())), fit: BoxFit.fill)
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
