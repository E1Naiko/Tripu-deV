package testAutoResizeLabel;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class LabelSize extends JPanel {
    private Font font;
    private JPanel panel;
    private JLabel label = new JLabel ("Font Size Adapter Label", JLabel.CENTER);
    private JTextField tf = new JTextField ("Type in text for new label here and hit [Enter]");

    public LabelSize() {
        super (new BorderLayout());
        panel = labelPanel();
        add (panel, "North");
        add (tf, "South");

        tf.addActionListener (new ActionListener () {
            public void actionPerformed (ActionEvent e) {
                label.setText (tf.getText());
                label.setFont (font);
                int labelW = (int) Math.ceil (label.getPreferredSize().getWidth());
                int maxWidth = (int) Math.floor (panel.getSize().getWidth());

                if (labelW <= maxWidth) return;

                for (int k = 1 ; labelW > maxWidth ; k++) {
                    Font labelFont = font.deriveFont (font.getSize() - k*1.0f);
                    label.setFont (labelFont);
                    labelW = (int) Math.ceil (label.getPreferredSize().getWidth());
                }
            }
        });
    }

    private JPanel labelPanel() {
        JPanel lp = new JPanel(new BorderLayout());
        lp.setPreferredSize (new Dimension (270,30));
        lp.add (label, "North");
        font = label.getFont();
        return lp;
    }

    public static void main (String[] args) {
        JFrame lsFrame = new JFrame ("Lfit");
        lsFrame.add (new LabelSize());
        lsFrame.pack();
        lsFrame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);
        lsFrame.setVisible(true);
    }
}
