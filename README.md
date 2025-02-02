https://www.youtube.com/watch?v=y6XCebnB9gs&t=226s

# estructura
ir poniendo con la misma estructura que en home
las configuraciones que quiera guardar

# uso de stow
stow . en la carpeta dotfiles
stow --adopt . si hay directorios que ya existen,
los directorios en los que hubo conflicto se van a reemplazar
por eso es bueno commitear antes de hacer esto por si hay macanas

# submodulos de git (nvim)
**Agrega el submódulo**  
   ```sh
   git submodule add git@github.com:tavolop3/nvchad.git .config/nvim
   ```

### **Cómo actualizar el submódulo en el futuro**
Cuando clones el repositorio en otra máquina, necesitarás inicializar los submódulos con:
```sh
git submodule update --init --recursive
```
Y para actualizarlos más adelante:
```sh
git submodule update --remote --merge
```

Así evitarás problemas y mantendrás el submódulo correctamente sincronizado con el repositorio original.
