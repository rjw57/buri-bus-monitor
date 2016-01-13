The '299 and '165 shift registers are used to both read/assert the data and
address busses and read control bus.

1. MOSI read and MISO set on *rising* edge of SCK.
2. Data is transferred *LSB first*.
3. "X" means "ignored" or "any".

The SPI exchange protocol is as follows:

1. Initially <span style="text-decoration: overline">BUSSEL</span> is **HIGH**
   and ADLOAD is **LOW**.
2. Set <span style="text-decoration: overline">AOE</span> and
   <span style="text-decoration: overline">DOE</span> **HIGH**. (This ensures no
   data is being asserted on bus.)
3. Set <span style="text-decoration: overline">BUSSEL</span> **LOW**.
4. Set ADLOAD **HIGH**.
5. Exchange one byte over SPI. Send: X. Receive: (MSB to LSB) SYNC,
   <span style="text-decoration: overline">NMI</span>,
   <span style="text-decoration: overline">IRQ</span>,
   <span style="text-decoration: overline">IOSEL</span>,
   RDY, <span style="text-decoration: overline">VP</span>,
   <span style="text-decoration: overline">ML</span>,
   X
6. Set ADLOAD **LOW**.
7. Send following bytes over SPI: X, D[0..7], A[0..7], A[8..15],
   A[16..23]. Received bytes are X, D[0..7], A[0..7], A[8..15], A[16..23]. (The
   received data and address values are observed. The sent ones are to be
   asserted.)
8. Set <span style="text-decoration: overline">BUSSEL</span> **HIGH**.
9. Set <span style="text-decoration: overline">AOE</span> and
   <span style="text-decoration: overline">DOE</span> appropriately to assert
   address and/or data bus.

