/**
 * 当一个组件定义了多个手势，flutter识别规则：
 *  - GestureDetector通过检查哪些手势事件的处理器不为null来获悉需要识别哪些手势
 *  - 当有多种手势需要识别时，按以下规则消除歧义：例如同时设置点击和拖动手势。
 *   - 任何时候，某种手势的识别器都可以宣告失败，直到只剩一个识别器，它就是胜利者。
 *     （按下去，一旦用户开始拖动，拖动手势就宣告成功。）
 *   - 任何时候，某种手势的识别器都可以宣告胜利，其他识别器将自动失败。
 *     （按下去，一旦用户立即松开，点击手势就宣告成功。）
 *  - 当只有一种手势需要识别时，识别会比较快，因为不需要消除歧义。
 */