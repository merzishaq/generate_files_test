#!/bin/bash

# Liste des clusters
CLUSTERS=("cluster1" "cluster2" "cluster3")  # Ajoutez vos noms de clusters ici

# Chemins des fichiers
PLAYBOOK="/chemin/vers/votre/playbook.yml"
INVENTORY_BASE="/chemin/vers/votre/dossier/inventories"

# Parcours de la liste des clusters
for CLUSTER in "${CLUSTERS[@]}"; do
    INVENTORY_DIR="$INVENTORY_BASE/$CLUSTER"

    # Vérification de l'inventaire
    if [ ! -d "$INVENTORY_DIR" ]; then
        echo "⚠️  Inventaire manquant pour le cluster : $CLUSTER"
        continue
    fi

    # Exécution du playbook
    echo "🚀 Lancement du playbook pour le cluster : $CLUSTER"
    ansible-playbook -i "$INVENTORY_DIR/inventory" "$PLAYBOOK"
    
    # Vérification du succès
    if [ $? -eq 0 ]; then
        echo "✅ Playbook exécuté avec succès pour le cluster : $CLUSTER"
    else
        echo "❌ Erreur lors de l'exécution du playbook pour le cluster : $CLUSTER"
    fi
    echo "--------------------------------------"
done
