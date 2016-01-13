The '299 and '165 shift registers are used to both read/assert the data and
address busses and read control bus.

1. MOSI read and MISO set on *rising* edge of SCK.
2. Data is transferred *LSB first*.
3. "X" means "ignored" or "any".

The SPI exchange protocol is as follows:

1. Initially ¬BUSSEL is **HIGH**
   and ADLOAD is **LOW**.
2. Set ¬AOE and
   ¬DOE **HIGH**. (This ensures no
   data is being asserted on bus.)
3. Set ¬BUSSEL **LOW**.
4. Set ADLOAD **HIGH**.
5. Exchange one byte over SPI. Send: X. Receive: (MSB to LSB) SYNC,
   ¬NMI,
   ¬IRQ,
   ¬IOSEL,
   RDY, ¬VP,
   ¬ML,
   X
6. Set ADLOAD **LOW**.
7. Send following bytes over SPI: X, D[0..7], A[0..7], A[8..15],
   A[16..23]. Received bytes are X, D[0..7], A[0..7], A[8..15], A[16..23]. (The
   received data and address values are observed. The sent ones are to be
   asserted.)
8. Set ¬BUSSEL **HIGH**.
9. Set ¬AOE and
   ¬DOE appropriately to assert
   address and/or data bus.

