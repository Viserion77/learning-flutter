class Transfer {
  final double value;
  final int numberAccount;

  Transfer(this.numberAccount, this.value);

  @override
  String toString() {
    return 'Transfer $value $numberAccount';
  }
}
