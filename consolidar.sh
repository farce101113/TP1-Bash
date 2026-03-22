sudo $HOME/EPNro1/entrada
touch FILENAME.txt | mv FILENAME.txt $HOME/EPNro1
  for file in $HOME/EPNro1/entrada/*.txt
      if [ -f "$file" ] ; then
        cat "$file" >> $HOME/EPNro1/salida/FILENAME.txt
        mv "$file" $HOME/EPNro1/procesado
      fi
  done
